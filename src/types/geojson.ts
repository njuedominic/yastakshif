export type PointGeometry = {
  type: "Point";
  coordinates: [number, number]; // [lng, lat]
};

export type GeoJSONFeature<T> = {
  type: "Feature";
  geometry: PointGeometry;
  properties: T;
};

export type FeatureCollection<T> = {
  type: "FeatureCollection";
  features: Array<GeoJSONFeature<T>>;
};
