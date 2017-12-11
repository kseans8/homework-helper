import React from 'react';
import QuestionIndexCard from '../components/questionIndexCard'

class QuestionIndexList extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      questions: [],
      answers: []
    }
  }

  componentDidMount() {
  fetch('http://localhost:3000/api/v1/questions')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`;
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      this.setState({
        questions: body.questions,
        answers: body.answers
      })
    })
  }

  render(){
    let questionComponents = this.state.questions.map((question) => {
      let answers = this.state.answers.filter(answer => {
        return (answer.question_id === question.id);
      })
      return(
        <QuestionIndexCard
          key={question.id}
          question={question}
          answers={answers}
        />
      )
    })
    return(
      <div>
        {questionComponents}
      </div>
    )
  }
}

export default QuestionIndexList;
