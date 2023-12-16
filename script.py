import os
import json


def process_txt_file(file_path):
    with open(file_path, 'r') as file:
        content = file.readline().split()
        jobs, factories, machines = map(int, content)

    file_name = os.path.splitext(os.path.basename(file_path))[0]

    # 使用 os.path.join 和 os.path.normpath 来生成标准路径
    normalized_path = os.path.normpath(os.path.join('DQCE', file_name + '.txt'))

    # 将路径中的反斜杠替换为斜杠
    normalized_path = normalized_path.replace('\\', '/')

    return {
        "name": file_name,
        "JOBS": jobs,
        "FACTORIES": factories,
        "MACHINES": machines,
        "path": normalized_path
    }


def generate_json_files(folder_path):
    json_data = []

    for file_name in os.listdir(folder_path):
        if file_name.endswith(".txt"):
            file_path = os.path.join(folder_path, file_name)
            json_data.append(process_txt_file(file_path))

    with open('instances.json', 'w') as json_file:
        json.dump(json_data, json_file, indent=2)


if __name__ == "__main__":
    folder_path = 'DQCE'  # 修改为实际的文件夹路径
    generate_json_files(folder_path)