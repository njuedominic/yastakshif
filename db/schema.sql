-- Enable PostGIS if not already enabled
CREATE EXTENSION IF NOT EXISTS postgis;

-- Admin boundaries table
CREATE TABLE IF NOT EXISTS admin_boundaries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  source TEXT NOT NULL DEFAULT 'osm',
  geom GEOMETRY(MULTIPOLYGON, 4326) NOT NULL
);

CREATE INDEX IF NOT EXISTS admin_boundaries_geom_idx
  ON admin_boundaries
  USING GIST (geom);

-- Attractions table
CREATE TABLE IF NOT EXISTS attractions (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT,
  opening_hours TEXT,

  osm_id BIGINT,
  osm_tags JSONB,

  geom GEOMETRY(POINT, 4326) NOT NULL,
  created_at TIMESTAMP DEFAULT now()
);

CREATE INDEX IF NOT EXISTS attractions_geom_idx
  ON attractions
  USING GIST (geom);
