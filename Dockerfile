#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["Average3DartScore/Average3DartScore.csproj", "Average3DartScore/"]
RUN dotnet restore "Average3DartScore/Average3DartScore.csproj"
COPY . .
WORKDIR "/src/Average3DartScore"
RUN dotnet build "Average3DartScore.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Average3DartScore.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
# ENTRYPOINT ["dotnet", "Average3DartScore.dll"]

CMD ASPNETCORE_URLS=http://*:$PORT dotnet Average3DartScore.dll