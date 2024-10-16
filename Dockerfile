FROM node:18-alpine

WORKDIR /app

# Build the gpx library
COPY ./gpx ./gpx
WORKDIR /app/gpx
RUN npm install && npm run build

# Install the website dependencies
WORKDIR /app/website
COPY ./website ./
RUN npm install

# Set the Mapbox token
ENV PUBLIC_MAPBOX_TOKEN=your_mapbox_token

# Expose the port for the SvelteKit app
EXPOSE 5173

# Run the SvelteKit dev server
CMD ["npm", "run", "dev"]
