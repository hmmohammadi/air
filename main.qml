import QtQuick 2.15
import QtQuick.Window 2.13
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.11
import QtGraphicalEffects 1.0
import "QMLChartData.js" as ChartsData
import "QChartJsTypes.js" as ChartTypes

Window {
    id: root
    maximumWidth: 1350
    minimumHeight: 670
    minimumWidth: 1350
    maximumHeight: 670

    width: 1350
    height: 670
    visible: true

    title: "Air Quality Dashboard"

    property int chart_width: 1045;
    property int chart_height: 313;
    property int chart_spacing: 20;
    property int text_height: 80;
    property int row_height: 8;
    property int iter: 20
    property var tempList: ChartsData.tempChartData




    Row {
        id: row
        x: 54
        y: 512
        width: root.width - row.spacing
        height: parent.height / 5.5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 36
        spacing: parent.width / 25

        TargetGasGaugeForm {
            id: cO
            unit: "ppm"
            targetGasName: "CO"
            targetGaz.maxValue: 500
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 40

            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.cos)
                    chart_temp.visible = false
                    chart_co.visible = true
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }

        }

        TargetGasGaugeForm {
            id: cH2O
            unit: "mg/m3"
            targetGasName: qsTr("CH<sub>2</sub>O")
            targetGaz.maxValue: 6.250
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 50
            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.cho2s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = true
                    charts.visible = false
                }
            }
        }

        TargetGasGaugeForm {
            id: cO2
            unit: "ppm"
            targetGasName: "cO<sub>2</sub>"
            targetGaz.maxValue: 5000 //5000
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 90

            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.co2s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = true
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }
        }

        TargetGasGaugeForm {
            id: humidity
            unit: "%PH"
            targetGasName: "humidity"
            targetGaz.maxValue: 100
            targetGaz.dialWidth: 6
            value: 0 //feeder.value
            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.hums)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = true
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }
        }

        TargetGasGaugeForm {
            id: nO2
            unit: "ppm"
            targetGasName: "nO<sub>2</sub>"
            targetGaz.maxValue: 10  // set the min value to 0.1
            targetGaz.minValue: 0.1
            targetGaz.dialWidth: 6
            value: 0 //feeder.value - 1
            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.no2s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = true
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }
        }

        TargetGasGaugeForm {
            id: pm1_0
            unit: "grades"
            targetGasName: "PM1.0"
            targetGaz.maxValue: 500
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 4

            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.pm10s)
                    //                    chart_line.chartData = ChartsData.pm10ChartData
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = true
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }
        }

        TargetGasGaugeForm {
            id: o3
            unit: "ppm"
            targetGasName: "o<sub>3</sub>"
            targetGaz.maxValue: 10
            targetGaz.dialWidth: 6
            value: 0 //feeder.value
            MouseArea {
                anchors.fill: parent
                onClicked: {
//                    console.log(air.o3s)
                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = true
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }

        }

        TargetGasGaugeForm {
            id: pM_2_5
            unit: "μg/m3"
            targetGasName: "PM2.5"
            targetGaz.maxValue: 1000
            targetGaz.dialWidth: 6
            value: 0 //feeder.value + 20
            MouseArea {
                anchors.fill: parent
                onClicked: {

                    chart_temp.visible = false
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = true
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false

                }
            }
        }
    }

    Row {
        id: row_temp
        x: 17
        y: 63
        width: 1316
        height: 406
        spacing: 23
        padding: 9

        Temperature {
            id: temperature
            value: 0

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    //                    console.log("Temprature")
                    chart_temp.visible = true
                    chart_co.visible = false
                    chart_co2.visible = false
                    chart_pm10.visible = false
                    chart_hum.visible = false
                    chart_pm25.visible = false
                    chart_o3.visible = false
                    chart_no2.visible = false
                    chart_cho2.visible = false
                    charts.visible = false
                }
            }

        }
        ///////////////////////////////  Charts ///////////////////////////////////////////
        Chart {
            id: charts
            width: chart_width //500 //chart_width
            visible: true
            height: chart_height
            chartType: 'line'
            chartData: { return {
                    labels:  ChartsData.show('time'),
                    datasets: [{
                            label: 'Co2',
                            fill: false,
                            backgroundColor:  "rgba(244,178,164,255)",
                            borderColor: 'rgba(244,178,164,255)',
                            data: air.co2s,
                        },{
                            label: 'Temprature',
                            fill: false,
                            backgroundColor:  "rgba(220,220,220,0.2)",
                            borderColor: 'rgba(128,192,255,255)',
                            data: air.temps,
                        }, {
                            label: 'O3',
                            fill: false,
                            backgroundColor: "rgb(226, 137, 242)",
                            borderColor: "rgb(226, 137, 242)",
                            //                            borderDash: [2, 2],
                            data: air.o3s,
                        }, {
                            label: 'PM2_5',
                            backgroundColor:  "rgb(151, 243, 126)",
                            borderColor:  "rgb(151, 243, 126)",
                            data: air.pm25s,
                            fill: false,
                        }, {
                            label: 'NO2',
                            fill: false,
                            backgroundColor: "rgb(133, 92, 248)",
                            borderColor: "rgb(133, 92, 248)",
                            //                            borderDash: [5, 5],
                            data: air.no2s,
                        }, {
                            label: 'Co',
                            fill: false,
                            backgroundColor: "rgb(165, 166, 246)",
                            borderColor:"rgb(165, 166, 246)",
                            //                            borderDash: [5, 5],
                            data: air.cos,
                        }, {
                            label: 'Humidity',
                            fill: false,
                            backgroundColor: "rgb(96, 125, 139)",
                            borderColor: "rgb(96, 125, 139)",
                            //                            borderDash: [5, 5],
                            data: air.hums,
                        }
                        , {
                            label: 'MP1.0',
                            fill: false,
                            backgroundColor: "rgba(248, 248, 39, 255)",
                            borderColor: "rgba(248, 248, 39, 255)",
                            //                            borderDash: [5, 5],
                            data: air.pm10s,
                        }, {
                            label: 'COH2',
                            fill: false,
                            backgroundColor: "rgb(38, 50, 56)",
                            borderColor: "rgb(38, 50, 56)",
                            data: air.cho2s,
                        }
                    ]
                }
            }


            chartOptions: {return {
                    maintainAspectRatio: false,
                    responsive: true,
                    title: {
                        display: true,
                        text: 'Gas Charts'
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Hour'
                                }
                            }],
                        yAxes: [{
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Value'
                                }
                            }]
                    }
                }
            }
        }

        QChartJs {
            id: chart_temp
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: tempList
            animation: true
            //               chartOptions: ChartsData.Options
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;

        }

        QChartJs {
            id: chart_pm10
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.pm10ChartData
            animation: true
            //               chartOptions: ChartsData.Options
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_pm25
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.pm25ChartData
            animation: true
            //               chartOptions: ChartsData.Options
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }
        QChartJs {
            id: chart_cho2
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.cho2ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }


        QChartJs {
            id: chart_co
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.coChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_co2
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.co2ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;




        }

        QChartJs {
            id: chart_hum
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.humChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_o3
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.o3ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }

        QChartJs {
            id: chart_no2
            width: chart_width
            visible: false
            height: chart_height
            chartType: ChartTypes.QChartJSTypes.LINE
            chartData: ChartsData.no2ChartData
            animation: true
            chartAnimationEasing: Easing.InOutElastic;
            chartAnimationDuration: 2000;
        }


    }

    Row {
        id: column
        x: 10
        y: 6
        width: 1316
        height: 51
        spacing: 16

        ComboBox {
            id: cbx
            width: 200
            model: ["Last Month",
                    "Last Two Months",
                    "Last Three Months",
                    "Last Six Months" ,
                    "Last Year",
                    "Whole Data"]
            editable: false
            focusPolicy: Qt.TabFocus
            flat: false
            currentIndex: 0
            onCurrentValueChanged: {
//                console.log("changed: " + " " + cbx.currentIndex + " " + cbx.currentValue)
//                air.get_index(cbx.currentIndex)
            }
        }

        Button {
            id: btn_save
            text: qsTr("Save as excel (.xlsx)")
            onClicked: {
                air.get_index(cbx.currentIndex)
            }
        }

        Button {
            id: btn_chart_gas
            text: qsTr("Show all charts")
            onClicked: {
//                console.log("basildi")
                chart_temp.visible = false
                chart_co.visible = false
                chart_co2.visible = false
                chart_pm10.visible = false
                chart_hum.visible = false
                chart_pm25.visible = false
                chart_o3.visible = false
                chart_no2.visible = false
                chart_cho2.visible = false
                charts.visible = true
            }
        }
    }

    Component.onCompleted: {

//        var gases = air.gases
        // set gas values
        temperature.value = air.temps[0]
        cO.value = air.cos[0]
        cH2O.value = air.cho2s[0] //Math.ceil(air.cho2s[0] - 20)
        cO2.value = air.co2s[0] //air.co2s[0] - 4300
        humidity.value = air.hums[0]
        nO2.value = air.no2s[0]
        o3.value = air.o3s[0]
        pM_2_5.value = air.pm25s[0]
        pm1_0.value = air.pm10s[0]
    }

    Timer
    {
        interval: 1000; running: true; repeat: true
        onTriggered: {
            air.updateGas()
            temperature.value = air.temps[0]
            cO.value = air.cos[0]
            cH2O.value = air.cho2s[0] //Math.ceil(air.cho2s[0] - 20)
            cO2.value = air.co2s[0] //air.co2s[0] - 4300
            humidity.value = air.hums[0]
            nO2.value = air.no2s[0]
            o3.value = air.o3s[0]
            pM_2_5.value = air.pm25s[0]
            pm1_0.value = air.pm10s[0]

            tempList = ChartsData.updateTemp(iter)
            chart_temp.chartRenderHandler = false
            iter = iter + 1;
//            chart_temp.chartData = tempList
            console.log('tempList-> ' + tempList.datasets[0].data)
            chart_temp.update()
            console.log('tempList-> ' + chart_temp.chartData.datasets[0].data)
//            chart_temp.visible = !(chart_temp.visible)
            console.log("Guncellendi .... !!! ", iter)



        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
