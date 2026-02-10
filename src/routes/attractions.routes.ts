import { Router } from "express";
import { FeatureCollection } from "../types/geojson";
import { AttractionProperties } from "../types/attraction";

const router = Router();

router.get("/", (_req, res) => {
  const response: FeatureCollection<AttractionProperties> = {
    type: "FeatureCollection",
    features: [
      {
        type: "Feature",
        geometry: {
          type: "Point",
          coordinates: [35.2350, 31.7780]
        },
        properties: {
          id: "1",
          name: "Western Wall",
          category: "religious",
          description: "Ancient limestone wall in the Old City"
        }
      }
    ]
  };

  res.json(response);
});

export default router;