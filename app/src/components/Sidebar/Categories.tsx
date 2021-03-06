/* eslint-disable react-hooks/exhaustive-deps */
import React, { FC, useEffect } from "react";
import { useCategories } from "../../stores";
import { Activity } from "../common/Activity/Activity";
import { AllCategory, Category, ReadLaterCategory } from "./Category";
import "./Categories.css";

export const Categories: FC = function Categories() {
  const {
    categories,
    categoriesGetInProgress,
    getCategories,
  } = useCategories();

  useEffect(() => {
    getCategories();
  }, []);

  return (
    <Activity inProgress={categoriesGetInProgress}>
      <div className="r-categories">
        <ReadLaterCategory />
        <AllCategory />
        {categories.map(({ category, feeds }) => (
          <Category key={category.id} category={category} feeds={feeds} />
        ))}
      </div>
    </Activity>
  );
};
