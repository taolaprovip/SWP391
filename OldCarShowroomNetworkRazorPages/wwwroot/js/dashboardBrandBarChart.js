const brands_chart = document.querySelector('#bar_brands_chart')



const data_brands = {
    labels: ['Brand 1', 'Brand 2', 'Brand 3'],
    datasets: [{
        data: [10, 5, 20, 14, 18, 7],
        backgroundColor: [
            '#6D7EFF',
            '#6D7EFF',
            '#6D7EFF',
        ]
    }]
}
const options_brands = {

    plugins: {
        legend: false
    },
    scales: {
        x: {
            grid: {
                display: false
            }
        },
        y: {
            min: 0,
            max: 30,
            ticks: {
                stepSize: 2,
                callback: value => value + 'K'
            },
            grid: {
                display: false
            }
        }
    }
}


const sold_count = document.querySelector('#sold_count')
const revenue_count = document.querySelector('#revenue_count')
const showroom_count = document.querySelector('#showroom_count')
console.log(showroom_count)
fetch(`/api/car/soldCount`)
    .then(res => res.json())
    .then(count => {
        sold_count.innerHTML = count

    })


fetch(`/api/car/totalSales`)
    .then(res => res.json())
    .then(revenue => {
        revenue_count.innerHTML = revenue

    })

fetch(`/api/showroom/totalShowrooms`)
    .then(res => res.json())
    .then(showroom => {
        
        showroom_count.innerHTML = showroom

    })
