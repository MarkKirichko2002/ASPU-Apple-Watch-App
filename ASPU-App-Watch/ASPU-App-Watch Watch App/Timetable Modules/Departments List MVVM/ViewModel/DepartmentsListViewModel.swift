//
//  DepartmentsListViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

struct DepartmentModel: Identifiable {
    let id: Int
    let name: String
    let teachers: [String]
}

struct Departments {
    
    static let departments = [
        DepartmentModel(
            id: 1,
            name: "Кафедра русского языка, литературы и методики их преподавания",
            teachers: [
                "Горина Ирина Ивановна",
                "Горобец Людмила Николаевна",
                "Дорофеева Ольга Алексеевна",
                "Евдокимова Марина Петровна",
                "Кириченко Инесса Васильевна",
                "Ковальчук Дмитрий Анатольевич",
                "Козлова Галина Анатольевна",
                "Никульникова Яна Станиславовна",
                "Селина Наталья Петровна",
                "Стрельникова Лариса Юрьевна",
                "Тарасова Ирина Игоревна",
                "Федченко Наталья Леонидовна",
                "Чернова Любовь Викторовна",
                "Четверикова Ольга Владимировна"
            ]
        ),
        DepartmentModel(
            id: 2,
            name: "Кафедра иностранных языков и методики их преподавания",
            teachers: [
                "Андреева Инна Алексеевна",
                "Геливера Лариса Олеговна",
                "Гридасова Альбина Владимировна",
                "Гринько Маргарита Артемовна",
                "Давыдова Анна Робертовна",
                "Давыдова Кира Валерьевна",
                "Егорова Ольга Николаевна",
                "Ковалевич Елена Павловна",
                "Коробчак Вера Накиповна",
                "Кузнецова Людмила Эдуардовна",
                "Малахова Светлана Анатольевна",
                "Несветайлова Ирина Валентиновна",
                "Оганян Лариса Рафиковна",
                "Паперная Нина Васильевна",
                "Папикян Анжела Валериондовна",
                "Рубцов Игорь Николаевич",
                "Соболева Елена Александровна",
                "Томашева Ирина Владимировна",
                "Форманюк Галина Анатольевна",
                "Ханджян Диана Давидовна",
                "Арутюнова Татьяна Сергеевна",
                "Носырева Светлана Георгиевна",
                "Шапринская Ольга Николаевна",
                "Ганман Ульяна Александровна",
                "Рязанцева Лилия Андреевна",
                "Черникова Валентина Евгеньевна"
            ]
        ),
        DepartmentModel(
            id: 3,
            name: "Кафедра математики, физики и методики их преподавания",
            teachers: [
                "Мозговая Мария Александровна",
                "Хорошилов Михаил Михайлович",
                "Немых Ольга Анатольевна",
                "Дьякова Елена Анатольевна",
                "Гурина Татьяна Александровна",
                "Холодова Светлана Николаевна",
                "Шермадина Наталья Александровна",
                "Иващенко Евгения Витальевна",
                "Паладян Каринэ Анатольевна",
                "Тарасова Татьяна Александровна",
                "Лещенко Елена Юрьевна",
                "Савадова Араксия Аркадьевна",
                "Корейба Ольга Владимировна",
                "Шишкин Евгений Маленович"
            ]
        ),
        DepartmentModel(
            id: 4,
            name: "Кафедра информатики и информационных технологий обучения",
            teachers: [
                "Карабут Наталья Викторовна",
                "Черноусова Ольга Гусейновна",
                "Лапшин Николай Александрович",
                "Лесная Елена Николаевна",
                "Лоба Инна Сергеевна",
                "Николаева Людмила Георгиевна",
                "Андрусенко Евгений Юрьевич",
                "Богданова Ардема Владимировна",
                "Ларина Ирина Борисовна",
                "Голодов Евгений Алексеевич",
                "Бельченко Владимир Евгеньевич",
                "Черняева Элеанора Петровна",
                "Казарян Маргарита Гайковна",
                "Костин Константин Анатольевич",
                "Стадник Светлана Сергеевна",
                "Бельченко Илья Владимирович",
                "Бирюков Станислав Валерьевич",
                "Рендович Вячеслав Валерьевич",
                "Крупко Степан Олегович"
            ]
        ),
        DepartmentModel(
            id: 5,
            name: "Кафедра социальной, специальной педагогики и психологии",
            teachers: [
                "Костенко Анаид Арсеновна",
                "Лахмоткина Валентина Ивановна",
                "Лебеденко Инна Юрьевна",
                "Дохоян Анна Меликсовна",
                "Алдакимова Ольга Викторовна",
                "Арутюнян Анна Александровна",
                "Арцимович Ирина Владимировна",
                "Белоус Ольга Валерьевна",
                "Евдокимова Елена Валериевна",
                "Егизарьянц Марина Николаевна",
                "Качалова Алевтина Васильевна",
                "Королькова Валентина Александровна",
                "Маслова Ирина Александровна",
                "Недбаева Светлана Викторовна",
                "Олешко Татьяна Ивановна",
                "Попова Анна Анатольевна",
                "Ромашина Елена Владимировна",
                "Скиба Наталья Владимировна",
                "Спевакова Софья Геннадьевна",
                "Спирина Валентина Ивановна",
                "Спирина Мария Леонидовна",
                "Сушков Андрей Валентинович",
                "Твелова Ирина Александровна",
                "Ткаченко Ирина Валериевна",
                "Шкрябко Ирина Павловна",
                "Ястребова Лариса Александровна"
            ]
        ),
        DepartmentModel(
            id: 6,
            name: "Кафедра физической культуры и медико-биологических дисциплин",
            teachers: [
                "Петина Наталья Леонидовна",
                "Аванесов Вачаган Семенович",
                "Арушанян Жанна Александровна",
                "Бужеря Снежана Александровна",
                "Василенко Виктория Густавовна",
                "Гончарова Оксана Владимировна",
                "Закарян Гайк Закарович",
                "Кондратюк Ирина Валерьевна",
                "Лысенко Ольга Алексеевна",
                "Мацко Андрей Иванович",
                "Рыбальченко Татьяна Петровна",
                "Тютюнникова Евгения Борисовна",
                "Чернышева Лариса Георгиевна"
            ]
        ),
        DepartmentModel(
            id: 7,
            name: "Кафедра теории, истории педагогики и образовательной практики",
            teachers: [
                "Андриенко Надежда Константиновна",
                "Андриенко Юлия Евгеньевна",
                "Ветров Юрий Павлович",
                "Галустов Амбарцум Робертович",
                "Галустов Роберт Амбарцумович",
                "Герлах Ирина Витальевна",
                "Живогляд Марина Вячеславовна",
                "Ибрагимова Инна Николаевна",
                "Лукаш Сергей Николаевич",
                "Мартиросян Света Гегамовна",
                "Плужникова Елена Артемовна",
                "Спирина Ольга Николаевна",
                "Терсакова Анжела Арсеновна",
                "Шкуропий Константин Викторович",
                "Эпоева Кнарик Владимировна",
                "Испирян Кнарик Спартаковна"
            ]
        ),
        DepartmentModel(
            id: 8,
            name: "Кафедра педагогики и технологий дошкольного и начального образования",
            teachers: [
                "Катуржевская Ольга Васильевна",
                "Артемова Анастасия Олеговна",
                "Богданова Валентина Юрьевна",
                "Гладченко Виктория Евгеньевна",
                "Дроговцова Наталья Олеговна",
                "Енгибарян Людмила Сергеевна",
                "Лисицкая Лариса Григорьевна",
                "Лукьяненко Ольга Дмитриевна",
                "Наврузова Елена Винидиктовна",
                "Овчаренко Елена Николаевна",
                "Павленко Ирина Васильевна",
                "Родионова Оксана Николаевна",
                "Семенака Светлана Ивановна",
                "Трибушная Галина Андреевна",
                "Тупичкина Елена Александровна",
                "Фоменко Наталья Викторовна",
                "Харланова Наталья Николаевна",
                "Булыгина Юлия Александровна"
            ]
        ),
        DepartmentModel(
            id: 9,
            name: "Кафедра технологии и дизайна",
            teachers: [
                "Зеленко Наталья Васильевна",
                "Штейнгардт Нина Сергеевна",
                "Богданов Владимир Николаевич",
                "Дикой Андрей Алексеевич",
                "Дикая Инна Владимировна",
                "Дегтярева Светлана Станиславовна",
                "Сиверская Ирина Викторовна",
                "Гончарова Ульяна Юрьевна",
                "Болдырева Леся Михайловна",
                "Хатунцев Александр Иванович",
                "Богров Денис Иванович"
            ]
        ),
        DepartmentModel(
            id: 10,
            name: "Кафедра экономики и управления",
            teachers: [
                "Пшмахова Мадина Исмаиловна",
                "Мукучян Размон Рубенович",
                "Прохорова Елена Александровна",
                "Чиянова Эльвира Владимировна",
                "Мкртычан Зоя Владимировна",
                "Манукайло Ирина Александровна",
                "Розанов Дмитрий Анатольевич",
                "Асланова Ольга Александровна",
                "Данильянц Эдуард Игоревич",
                "Черкасский Петр Андреевич",
                "Должкова Татьяна Александровна",
                "Бреславцева Елена Александровна",
                "Белоусова Анна Олеговна",
                "Осипова Роксана Григорьевна"
            ]
        ),
        DepartmentModel(
            id: 11,
            name: "Кафедра всеобщей и отечественной истории",
            teachers: [
                "Пшмахова Мадина Исмаиловна",
                "Мукучян Размон Рубенович",
                "Прохорова Елена Александровна",
                "Чиянова Эльвира Владимировна",
                "Мкртычан Зоя Владимировна",
                "Манукайло Ирина Александровна",
                "Розанов Дмитрий Анатольевич",
                "Асланова Ольга Александровна",
                "Данильянц Эдуард Игоревич",
                "Черкасский Петр Андреевич",
                "Должкова Татьяна Александровна",
                "Бреславцева Елена Александровна",
                "Белоусова Анна Олеговна",
                "Осипова Роксана Григорьевна"
            ]
        ),
        DepartmentModel(
            id: 12,
            name: "Кафедра философии, права и социально-гуманитарных наук",
            teachers: [
                "Басов Игорь Иванович",
                "Геворгян Гаяне Аршалуйсовна",
                "Гурова Евгения Александровна",
                "Грицких Игорь Владимирович",
                "Карапкова Олеся Григорьевна",
                "Коняхин Александр Сергеевич",
                "Ктиторов Сергей Николаевич",
                "Курьян Анжела Мисаковна",
                "Лысенко Роман Юрьевич",
                "Малахова Анастасия Сергеевна",
                "Назаров Сергей Васильевич",
                "Назарова Вероника Вячеславовна",
                "Панарин Андрей Анатольевич",
                "Панарина Елена Владимировна",
                "Пелих Алексей Леонидович",
                "Приймак Юрий Владимирович",
                "Розанова Яна Александровна",
                "Хлудова Людмила Николаевна",
                "Христофорова Елена Дмитриевна",
                "Шихавцова Виктория Михайловна"
            ]
        ),
    ]
}

final class DepartmentsListViewModel: ObservableObject {
    
    var departments = Departments.departments
    @Published var isPresented = false
    @Published var currentId = 1
    
}
