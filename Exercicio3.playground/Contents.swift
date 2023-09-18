import UIKit

//Lista de Tarefas.

// Protocolo tarefa
protocol Task {
    var title: String { get }
    var isCompleted: Bool { get set }
}

struct SimpleTask: Task {
    var title: String
    var isCompleted: Bool = false
}

// Protocolo listaTarefas
protocol TaskList {
    var tasks: [Task] { get set }
    func addTask(_ task: Task)
    func completeTask(at index: Int)
}

class SimpleTaskList: TaskList {
    var tasks: [Task] = []
    
    func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    func completeTask(at index: Int) {
        if index >= 0 && index < tasks.count {
            tasks[index].isCompleted = true
        }
    }
}

func printTaskList(_ taskList: TaskList) {
    for (index, task) in taskList.tasks.enumerated() {
        let status = task.isCompleted ? "✅" : "❌"
        print("\(index + 1). \(status) \(task.title)")
    }
}

let task1 = SimpleTask(title: "Estudar")
let task2 = SimpleTask(title: "Ir ao banco")
let task3 = SimpleTask(title: "Pagar o pintor")

// Lista de tarefas
let taskList = SimpleTaskList()
taskList.addTask(task1)
taskList.addTask(task2)
taskList.addTask(task3)
//taskList.addTask(task4)



print("Lista de Tarefas (Antes de Completar):")
printTaskList(taskList)


let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

concurrentQueue.async {
    taskList.completeTask(at: 2)
}
concurrentQueue.async {
    taskList.completeTask(at: 1)
}
concurrentQueue.async {
    taskList.completeTask(at: 0)
}


concurrentQueue.sync {}

// Imprimindo a lista de tarefas após completar
print("\nTarefas Concluidas:")
printTaskList(taskList)
