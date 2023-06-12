pragma solidity ^0.8.0;

contract Voter {
    struct Candidate {
        string name;
        uint256 voteCount;
    }
    
    mapping(address => bool) public hasVoted;
    Candidate[] public candidates;

    event Vote(address indexed voter, uint256 indexed candidateIndex);

    constructor(string[] memory _candidateNames) {
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            candidates.push(Candidate({name: _candidateNames[i], voteCount: 0}));
        }
    }

    function vote(uint256 _candidateIndex) public {
        require(_candidateIndex < candidates.length, "Invalid candidate index");
        require(!hasVoted[msg.sender], "Already voted");

        candidates[_candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;

        emit Vote(msg.sender, _candidateIndex);
    }

    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    function getCandidate(uint256 _candidateIndex) public view returns (string memory, uint256) {
        require(_candidateIndex < candidates.length, "Invalid candidate index");

        Candidate memory candidate = candidates[_candidateIndex];
        return (candidate.name, candidate.voteCount);
    }
}
