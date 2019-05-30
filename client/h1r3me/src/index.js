
let addBtn = document.querySelector('#new-applicant-btn')
let applicantForm = document.querySelector('.ui.center.aligned.segment')
let updateForm = document.querySelector('ui.raised.very.padded.text.teal.container.inverted.segment')
let formEl = document.querySelector('.ui form')

let applicantsUrl='http://localhost:3000/applicants'
let addApplicant = false
let updateApplicant = false
let selectedApplicant = null


addBtn.addEventListener('click', () => {
  // hide & seek with the form
  addApplicant = !addApplicant
  if (addApplicant) {
    applicantForm.style.display = 'block'

  } else {
    applicantForm.style.display = 'none'
  }
})


formEl.addEventListener('submit', (event) => {
   console.log('clicked submit inside the form')
   fetch('http://localhost:3000/applicants', {
     method:'POST',
     headers:{'Content-Type':'application/json',
        'Accept':'application/json'
        },
        body:JSON.stringify({
          applicant: {
          full_name:'',
          first_name:formEl.fname.value,
          last_name:formEl.lname.value,
          email:formEl.email.value,
          phone_number:formEl.phone_number.value

        }}
        )})
         .then(res => res.json())
         .then(applicants => console.log(applicants))
})


let ApplicantTable = document.querySelector('#body')



function getApplicants(applicants){
  applicants.forEach(applicant => {
      getApplicant(applicant)
  });

}

function getApplicant(applicant) {

     ApplicantRow = document.createElement('tr')

    // const currentStage = applicant.applicants_stage[applicant.applicants_stage.length - 1]

    ApplicantRow.innerHTML = `
    <td>${applicant.first_name}</td>
    <td>${applicant.last_name}</td>
     <td>${applicant.email}</td>
     <!-- <td>${applicant.phone_number}</td> -->
     <td>${applicant.current_applicants_stage.stage.name}</td>

    <td>${applicant.current_applicants_stage.comment}</td>
     <td>${applicant.current_applicants_stage.completed}</td>
      <td>${applicant.current_applicants_stage.date}</td>
      <!-- <td>${applicant.current_applicants_stage.time}</td> -->
      <!-- <td>${applicant.current_applicants_stage.duration}</td> -->
      <td>${applicant.current_applicants_stage.email_sent}</td>
      <!-- <td>${applicant.current_applicants_stage.location}</td> -->
      <td>${applicant.current_applicants_stage.outcome}</td>
     <td><button>Create New Stage</button></td>

    `
    ApplicantTable.appendChild(ApplicantRow)

    let stage = ['CV Screening','Phone Interview','Face to Face Interview', 'Hr Meeting']


   let updateBtn = ApplicantRow.querySelector('button')
   updateBtn.addEventListener('click', function (event) {
     const stageForm = document.querySelector('.update-form')

     stageForm.comment.value = applicant.current_applicants_stage.comment
     stageForm.outcome.checked = applicant.current_applicants_stage.outcome
     stageForm.completed.checked = applicant.current_applicants_stage.completed

     stageForm.addEventListener('submit', function (event) {
       event.preventDefault()
       console.log(event)
       updateStage({
         id: applicant.current_applicants_stage.id,
         comment: stageForm.comment.value,
         outcome: stageForm.outcome.checked,
         completed: stageForm.completed.checked
       })
     })
    console.log(applicant.current_applicants_stage)

    // populate form fields with current_applicants_stage info

    // add event listener to form
    // post values to api

    // updateStage(applicant)
  })
}

function updateStage(applicantStage){

  //         console.log(`my id is ${applicant.id} `)
     fetch('http://localhost:3000/applicants_stages/' + applicantStage.id, {
       method:'PATCH',
       headers:{'Content-Type':'application/json',
          'Accept':'application/json'
          },
          body:JSON.stringify({
            applicants_stage: applicantStage}
      )})
          .then(res => res.json())
          .then(applicants => console.log(applicants))

}

function renderApplicants(){
    return fetch('http://localhost:3000/applicants')
        .then(resp => resp.json())
}

renderApplicants()
    .then(getApplicants)
