
function clickMinus() {		/* 수량 파트 : (-) 클릭할 때 */
 	var tfQuantity = document.getElementById('quantity');		// 수량 텍스트 필드에 입력되어있는 값(문자).
    var currentValue = parseInt(tfQuantity.value);				// 현재 수량 텍스트 필드에 입력되어있는 값(정수).
    if (currentValue >= 1) {									// 현재 텍스트 필드의 숫자가 1 이상이면 (최소값이 0이 되도록 하기 위함)
      tfQuantity.value = currentValue - 1;						// 현재 텍스트 필드 값에서 1 뺀 값을 현재값으로 할당. 
    }
      calcPrice();												
  }
  
  function clickPlus() {		/* 수량 파트 : (+) 클릭할 때 */
  	var tfQuantity = document.getElementById('quantity');		// 수량 텍스트 필드에 입력되어있는 값(문자).
    var currentValue = parseInt(tfQuantity.value);				// 현재 수량 텍스트 필드에 입력되어있는 값(정수).
    tfQuantity.value = currentValue + 1;						// 현재 텍스트 필드 값에서 1 더한 값을 현재값으로 할당. 
	calcPrice();
  }
  
  function updateQuantity(value) {	/* onchange - 입력필드 내용 변경 후 포커스 이동시 할 일. */
  	var tfQuantity = document.getElementById('quantity');		// 수량 텍스트 필드에 입력되어있는 값(문자).
    var currentValue = parseInt(value);							// 현재 필드에 입력된 값. 
    if (!isNaN(currentValue) && currentValue >= 1) {			// 현재 필드에 입력된 값이 공백이 아니면서 1 이상이면 
      tfQuantity.value = currentValue;							// 입력필드의 값을 현재 값으로 할당. 
    } else {													// 현재 필드의 값이 공란이거나 1 미만 값이 입력될 때 
      tfQuantity.value = 1;										// 입력필드의 현재 값을 1로 세팅해두기 
    }
  	  calcPrice();
  }
  
 

  
  
  

      