window.onload = function () {
    const pagination = document.querySelector(".pagination");
  
    if (pagination) {
      const paginationNumbers = document.querySelectorAll(".pagination__number");
      let paginationActiveNumber = document.querySelector(".pagination__number--active");
      const paginationNumberIndicator = document.querySelector(".pagination__number-indicator");
      const paginationLeftArrow = document.querySelector(".pagination__arrow:not(.pagination__arrow--right)");
      const paginationRightArrow = document.querySelector(".pagination__arrow--right");
  
      const positionIndicator = (element) => {
        const paginationRect = pagination.getBoundingClientRect();
        const paddingElement = parseInt(window.getComputedStyle(element, null).getPropertyValue("padding-left"), 10);
        const elementRect = element.getBoundingClientRect();
        paginationNumberIndicator.style.left = `${elementRect.left + paddingElement - paginationRect.left}px`;
        paginationNumberIndicator.style.width = `${elementRect.width - paddingElement * 2}px`;
        paginationNumberIndicator.style.opacity = element.classList.contains("pagination__number--active") ? 1 : 0.2;
      };
  
      const setActiveNumber = (element) => {
        if (!element || element.classList.contains("pagination__number--active")) return;
        paginationActiveNumber.classList.remove("pagination__number--active");
        element.classList.add("pagination__number--active");
        paginationActiveNumber = element;
        setArrowState();
        positionIndicator(paginationActiveNumber);
      };
  
      const disableArrow = (arrow, disable) => {
        arrow.classList.toggle("pagination__arrow--disabled", disable);
      };
  
      const setArrowState = () => {
        disableArrow(paginationLeftArrow, !paginationActiveNumber.previousElementSibling);
        disableArrow(paginationRightArrow, !paginationActiveNumber.nextElementSibling);
      };
  
      paginationLeftArrow.addEventListener("click", () => {
        setActiveNumber(paginationActiveNumber.previousElementSibling);
      });
  
      paginationRightArrow.addEventListener("click", () => {
        setActiveNumber(paginationActiveNumber.nextElementSibling);
      });
  
      Array.from(paginationNumbers).forEach((element) => {
        element.addEventListener("click", () => {
          setActiveNumber(element);
        });
  
        element.addEventListener("mouseover", () => {
          positionIndicator(element);
        });
  
        element.addEventListener("mouseout", () => {
          positionIndicator(paginationActiveNumber);
        });
      });
  
      positionIndicator(paginationActiveNumber); // Initialize the indicator position
    }
  };
