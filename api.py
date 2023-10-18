from starlette.applications import Starlette
from starlette.responses import JSONResponse
from starlette.routing import Route

import morfeusz2


morfeusz = morfeusz2.Morfeusz()


async def morphological_analysis(request):
    data = await request.json()
    text = data.get("text", "")

    # Morfeusz analysis
    analysis = morfeusz.analyse(text)

    # You can modify the returned structure as per your needs
    return JSONResponse({"analysis": analysis})


routes = [
    Route("/api/analyse", morphological_analysis, methods=["POST"]),
]

app = Starlette(debug=True, routes=routes)
