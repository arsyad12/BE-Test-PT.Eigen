function longestSentence(inputSentence){
    let toArray = inputSentence.split(' ')
    console.log(toArray)
    let longest = 0
    
     toArray.forEach(kata => {
        longest = Math.max( kata.length , longest);
    });
    
    const result = toArray.filter((word) => word.length == longest);
    
    console.log(`${result}: ${longest} charackter`)
    
}

longestSentence("Saya sangat senang mengerjakan soal algoritma")