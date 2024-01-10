function reverse(inputString) {
    const lastChar = inputString.slice(-1);
    
    const reversedPart = inputString.slice(0, -1).split('').reverse().join('');
    
    const reversedString =  reversedPart + lastChar;
    
    console.log(reversedString);
}
 
reverse("NEGIE1");