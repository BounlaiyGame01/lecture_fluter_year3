from fastapi import FastAPI, status, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from database import getConnect
from pydantic import BaseModel
from passlib.context import CryptContext
from datetime import datetime, timedelta

app = FastAPI(title="API for Book Management")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

class book(BaseModel):
    bookId: int
    bookName: str
    bookPrice: float
    bookPage: int

@app.get("/")
def read_root():
    return {"Message": "Server is running"}
#---------------------------
#SHOW ALL BOOKS METHOD
#---------------------------
@app.get("/books")
def get_books():
    try:
        con = getConnect()
        with con.cursor() as cursor:
            sql = "Select * from book"
            cursor.execute(sql)
            result = cursor.fetchall()
            print("result")
            return {"data": result}
    except Exception as e:
        print("ERROR:", e)
        return {"error": str(e)}
    finally:
        con.close()
#---------------------------
#SEARCH METHOD
#---------------------------
@app.get("/books/{book_id}")
def search_book(book_id: int):
    try:
        con = getConnect()
        with con.cursor() as cursor:
            sql = "SELECT * FROM book WHERE id LIKE %s or bookName LIKE %s"
            val = (f"%{book_id}%", f"%{book_id}%")
            cursor.execute(sql, val)
            result = cursor.fetchone()
            if result:
                return {"data": result}
            else:
                raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")
    except Exception as e:
        print("ERROR:", e)
        return {"error": str(e)}
    finally:
        con.close()
#---------------------------
#INSERT METHOD
#---------------------------
@app.post("/books/add")
def add_book(book: dict):
    try:
        con = getConnect()
        with con.cursor() as cursor:
            sql = "INSERT INTO book (bookName, page, price) VALUES (%s, %s, %s)"
            cursor.execute(sql, (book['bookName'], book['bookPage'], book['bookPrice']))
            con.commit()
            new_id = cursor.lastrowid
            cursor.execute("SELECT * FROM book WHERE id = %s", (new_id,))
            new_book = cursor.fetchone()
            return {"message": "Book added successfully", "data": new_book}
    except Exception as e:
        print("ERROR:", e)
        return {"error": str(e)}
    finally:
        con.close()
#---------------------------
# UPDATE METHOD
#---------------------------
@app.put("/books/update/{book_id}")
def update_book(book_id: int, book: dict):
    try:
        con = getConnect()
        with con.cursor() as cursor:
            sql = "UPDATE book SET bookName = %s, page = %s, price = %s WHERE id = %s"
            cursor.execute(sql, (book['bookName'], book['bookPage'], book['bookPrice'], book_id))
            con.commit()
            if cursor.rowcount > 0:
                cursor.execute("SELECT * FROM book WHERE id = %s", (book_id,))
                updated_book = cursor.fetchone()
                return {"message": "Book updated successfully", "data": updated_book}
            else:
                raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")
    except Exception as e:
        print("ERROR:", e)
        return {"error": str(e)}
    finally:
        con.close()
#---------------------------
# DELETE METHOD
#---------------------------
@app.delete("/books/delete/{book_id}")
def delete_book(book_id: int):
    try:
        con = getConnect()
        with con.cursor() as cursor:
            cursor.execute("SELECT * FROM book WHERE id = %s", (book_id,))
            deleted_book = cursor.fetchone()
            if not deleted_book:
                raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Book not found")
            cursor.execute("DELETE FROM book WHERE id = %s", (book_id,))
            con.commit()
            return {"message": "Book deleted successfully", "data": deleted_book}
    except Exception as e:
        print("ERROR:", e)
        return {"error": str(e)}
    finally:
        con.close()
