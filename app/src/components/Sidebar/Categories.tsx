/* eslint-disable react-hooks/exhaustive-deps */
import React, { FC, useEffect } from "react";
import { useCategories, useApp, useSection } from "../../stores";
import { Activity } from "../common/Activity/Activity";
import { AllCategory, Category, ReadLaterCategory } from "./Category";
import "./Categories.css";

export const Categories: FC = function Categories() {
  const app = useApp();
  const { section } = useSection();
  const {
    categories,
    categoriesGetInProgress,
    getCategories,
    getCategoriesUnreadCounts,
  } = useCategories();

  useEffect(() => {
    getCategories();
  }, []);

  useEffect(() => {
    getCategoriesUnreadCounts();
  }, [app.refreshMark, section]);

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
