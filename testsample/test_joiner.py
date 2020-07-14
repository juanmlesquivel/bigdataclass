from .joiner import join_dataframes


def test_one_column_join(spark_session):
    grades_data = [(1, 50), (2, 100)]
    grades_ds = spark_session.createDataFrame(grades_data,
                                              ['student_id', 'grade'])
    student_data = [(1, 'Juan'), (2, 'Maria')]
    student_ds = spark_session.createDataFrame(student_data,
                                               ['id', 'name'])

    grades_ds.show()
    student_ds.show()

    actual_ds = join_dataframes(grades_ds, student_ds, ['student_id'], ['id'])

    expected_ds = spark_session.createDataFrame(
        [
            (1, 50, 1, 'Juan'),
            (2, 100, 2, 'Maria'),
        ],
        ['student_id', 'grade', 'id', 'name'])

    expected_ds.show()
    actual_ds.show()

    assert actual_ds.collect() == expected_ds.collect()
