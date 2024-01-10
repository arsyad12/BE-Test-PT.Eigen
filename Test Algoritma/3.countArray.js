function hitungKemunculanArray(QUERY, INPUT) {
    const hasil = QUERY.map(queryItem => {
        const kemunculan = INPUT.filter(inputItem => inputItem === queryItem).length;
        return kemunculan;
    });

    console.log(hasil);
}

const INPUT = ['xc', 'dz', 'bbb', 'dz'];
const QUERY = ['bbb', 'ac', 'dz'];

hitungKemunculanArray(QUERY, INPUT);


