import fastapi


app = fastapi.FastAPI()
car_owner = "Tahel"


@app.get("/")
async def root():
    return {"message": "Hello World"}


@app.get("/users/{user_name}")
async def login(user_name):
    legal_users = ["Meitar", "Tahel"]
    if user_name in legal_users:
        return {"login": True}
    else:
        return {"login": False}


@app.get("/car_state/{user_name}")
async def get_car_state(user_name):
    return {"car_location": car_owner}
