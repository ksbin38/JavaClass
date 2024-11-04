import { Route, Routes, NavLink, useParams } from 'react-router-dom';

const contents = [
    {id: 1, title: 'HTML', description: 'HTML is ...'},
    {id: 2, title: 'JS', description: 'JS is ...'},
    {id: 3, title: 'REACT', description: 'REACT is ...'},
];
  
function Topic() {
    const {topic_id} = useParams();
    let selectedTopic = {
      title: "Sorry",
      description: "Not Found"
    };
    for (let i = 0; i < contents.length; i++) {
      if (contents[i].id === Number(topic_id)) {
        selectedTopic = contents[i];
      }
    }
    return (
      <div>
        <h2>{selectedTopic.title}</h2>
        <p>{selectedTopic.description}</p>
      </div>
    )
}
  
function Topics() {
  
    let lis = [];
    // for (let i = 0; i < contents.length; i++) {
      // lis.push(
      // <li key={contents[i].id}>
        // <NavLink to={'/topics/' + contents[i].id}>{contents[i].title}</NavLink>
      // </li>
    // );
    // }
    contents.forEach(item => {
      lis.push(
        <li key={item.id}>
          <NavLink to={'/topics/' + item.id}>{item.title}</NavLink>
        </li>
      );
    })
  
    return (
      <div>
        <h2>Topics</h2>
        <ul>
          {lis}
        </ul>
        <Routes>
          <Route path="/:topic_id" element={<Topic />} />
        </Routes>
      </div>
    )
}

export default Topics;