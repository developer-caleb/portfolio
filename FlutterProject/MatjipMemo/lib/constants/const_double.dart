const double anchorHeight = 0.25; //map mark에서 anchor 위치
//const List<double> clusterLevel = [0.5, 2, 5, 7, 11, 12, 13, 14, 15, 16, 17];
//const List<double> clusterLevel = [1, 4, 6, 8, 11, 12, 13, 14, 15, 16, 17]; ~22.06.22
//const List<double> myClusterLevel = [3, 5.5, 7.5, 9, 11, 16, 22]; //내 식당
//앞에 있는 것이 큰 지도, 줌 많이 땡겼을 때가 뒤의 숫자를 표시함-> 앞에 있는 걸 숫자 간격을 줄이면 앞에있는 지도가 덜 뭉침, 뒤에있는 숫자 간격을 줄이면, 뒤에있는 숫자가 덜뭉침
const List<double> myClusterLevel = [1, 3, 6, 9, 11, 13.5, 15, 17]; //내 식당
//const List<double> myClusterLevel = [1, 3, 6, 9, 11, 12, 13, 14]; //내 식당
//const List<double> clusterLevel = [5.5, 7.5, 9, 11, 12, 13, 14, 15, 16, 17]; //광장
//const List<double> clusterLevel = [5.5, 7.5, 9, 11, 12, 13, 14, 18, 20, 22]; //광장
const List<double> clusterLevel = [5.5, 7.5, 9, 11, 12, 13, 15.5, 18]; //광장
//const List<double> clusterLevel = [3, 5.5, 7.5, 9, 11, 12, 13, 14, 15, 16, 17]; //예전 광장
const moimPictureAspect = 1.5;
// levels: [7, 8, 9, 10, 11, 12, 13, 16, 18]
// levels: [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17] //후반에 너무 빨리 합쳐지는데?
// levels: [1, 3, 7, 8, 11, 12, 13, 14, 15, 16, 17] //조금 괜찮아짐
