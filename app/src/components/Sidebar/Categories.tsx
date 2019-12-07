import React, { FC, useEffect } from "react";
import { useCategories } from "../../stores";
import { Activity } from "../common/Activity/Activity";
import { AllCategory, Category } from "./Category";
import "./Categories.css";

export const Categories: FC = function Categorries() {
  const {
    categories,
    categoriesGetInProgress,
    getCategories
  } = useCategories();

  useEffect(() => {
    getCategories();
  }, [getCategories]);

  return (
    <Activity inProgress={categoriesGetInProgress}>
      <div className="r-categories">
        <AllCategory />
        {categories.map(({ category, feeds }) => (
          <Category key={category.id} category={category} feeds={feeds} />
        ))}
      </div>
    </Activity>
  );
};
