
//enhanced voting0
pragma solidity 0.8.18;
contract Voter {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public hasVoted;
    mapping(address => bool) public isCandidate;
    mapping(address => uint256) public candidateIndex;
    Candidate[] public candidates;

    event Vote(address indexed voter, uint256 indexed candidateIndex);
    event CandidateAdded(address indexed candidate, string name);

    constructor(string[] memory _candidateNames) {
        for (uint256 i = 0; i < _candidateNames.length; i++) {
            addCandidate(_candidateNames[i]);
        }
    }

    function vote(uint256 _candidateIndex) public {
        require(_candidateIndex < candidates.length, "Invalid candidate index");
        require(!hasVoted[msg.sender], "Already voted");

        candidates[_candidateIndex].voteCount++;
        hasVoted[msg.sender] = true;

        emit Vote(msg.sender, _candidateIndex);
    }

    function addCandidate(string memory _name) public {
        require(!isCandidate[msg.sender], "Already a candidate");
        
        candidates.push(Candidate({name: _name, voteCount: 0}));
        isCandidate[msg.sender] = true;
        candidateIndex[msg.sender] = candidates.length - 1;

        emit CandidateAdded(msg.sender, _name);
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
