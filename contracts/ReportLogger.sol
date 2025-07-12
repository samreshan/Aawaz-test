// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReportLogger {
    struct Report {
        uint id;
        string title;
        string description;
        string coords;
        string photo;
        uint timestamp;
        address user;
    }

    Report[] public reports;

    event ReportCreated(uint id, string title, address user);

    function createReport(
        string memory _title,
        string memory _description,
        string memory _coords,
        string memory _photo
    ) public {
        reports.push(Report(
            reports.length,
            _title,
            _description,
            _coords,
            _photo,
            block.timestamp,
            msg.sender
        ));
        emit ReportCreated(reports.length - 1, _title, msg.sender);
    }

    function getReportCount() public view returns (uint) {
        return reports.length;
    }

    function getReport(uint _id) public view returns (
        uint id,
        string memory title,
        string memory description,
        string memory coords,
        string memory photo,
        uint timestamp,
        address user
    ) {
        Report storage report = reports[_id];
        return (
            report.id,
            report.title,
            report.description,
            report.coords,
            report.photo,
            report.timestamp,
            report.user
        );
    }
}
