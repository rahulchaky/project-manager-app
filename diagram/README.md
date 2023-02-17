Notes for Diagram:
- Login(?)

- User
    - id
    - username

- Permission
    - id
    - project_id 
        - (user_id, project_id) is what gives access, if it doesnt exist then you cannot access the project
    - user_id

- Project
    - id
    - name
    - status (?)
    - description

- Task
    - id
    - project_id
    - name
    - status
    - description

- Bugs
    - id
    - task_id
    - bug type
    - description
    - status