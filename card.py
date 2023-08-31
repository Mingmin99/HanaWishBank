from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker("ko_KR")  # 한국어 데이터 생성을 위해 로케일을 설정합니다.

# 미리 만들어둔 한국어 문장 데이터
korean_sentences = [
    "결제"
]

# 부모 카테고리와 해당하는 세분화 카테고리 매핑
detailed_categories_mapping = {
    'A': ['A1', 'A2', 'A3', 'A4'],
    'B': ['B1', 'B2', 'B3', 'B4'],
    'C': ['C1', 'C2', 'C3'],
    'D': ['D1', 'D2', 'D3', 'D4', 'D5'],
    'E': ['E1', 'E2', 'E3', 'E4'],
    'F': ['F1', 'F2', 'F3'],
    'G': ['G1', 'G2', 'G3'],
    'H': ['H1', 'H2', 'H3', 'H4'],
    'I': ['I1']
}

# 가짜 카드 사용내역 데이터 생성
def generate_card_transaction():
    transaction_date = fake.date_between(start_date='-1M', end_date='today')
    card_number = 'C001'  # 고정된 CardID 값
    member_id = 'user001'  # 고정된 MemberID 값
    installment_period = random.choices([0, 1, 3, 6, 12], weights=[5, 1, 1, 1, 1])[0]
    expense_amount = fake.random_int(min=1000, max=100000)
    description = random.choice(korean_sentences)  # 미리 정의한 한국어 문장 데이터 사용
    expense_category_code = random.choices(['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'], weights=[5, 4, 1, 4, 4, 1, 1, 1, 1])[0]  # 가중치 설정
    detailed_expense_category_code = random.choice(detailed_categories_mapping[expense_category_code])
    billing_date = transaction_date + timedelta(days=random.randint(20, 30))

    return {
        'ExpenseID': None,  # Placeholder for ExpenseID
        'CardID': card_number,
        'MemberID': member_id,
        'INSTALLMENT_PERIOD': installment_period,
        'EXPENSE_AMOUNT': expense_amount,
        'DESCRIPTION': description,
        'EXPENSE_CATEGORY_CODE': expense_category_code,
        'DETAILED_EXPENSE_CATEGORY_CODE': detailed_expense_category_code,
        'EXPENSE_DATE': transaction_date.strftime('%Y-%m-%d'),
        'BILLING_DATE': billing_date.strftime('%Y-%m-%d')
    }

for _ in range(50):
    transaction = generate_card_transaction()
    expense_category_code = transaction['EXPENSE_CATEGORY_CODE']  # 리스트에서 값 하나 가져오기
    detailed_expense_category_code = transaction['DETAILED_EXPENSE_CATEGORY_CODE']
    sql_insert = f"INSERT INTO Expense (CardID, MemberID, INSTALLMENT_PERIOD, ExpenseAmount, DESCRIPTION, ExpenseCategoryCode, DetailedExpenseCategoryCode, ExpenseDate, BILLING_DATE) VALUES ('{transaction['CardID']}', '{transaction['MemberID']}', {transaction['INSTALLMENT_PERIOD']}, {transaction['EXPENSE_AMOUNT']}, '{transaction['DESCRIPTION']}', '{expense_category_code}', '{detailed_expense_category_code}', TO_DATE('{transaction['EXPENSE_DATE']}', 'YYYY-MM-DD'), TO_DATE('{transaction['BILLING_DATE']}', 'YYYY-MM-DD'));"
    print(sql_insert)
