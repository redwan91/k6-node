import http from 'k6/http';
import dayjs from 'dayjs';

function test1 () {

    const formattedDate = dayjs().format('YYYY-MM-DD HH:mm:ss');
    console.log(`Current time: ${formattedDate}`);

    const response = http.get('https://test.k6.io');
    const body = response.body;
    console.log(`Response status: ${response.status}`);

}

export default test1;

