dt=$(date '+%d-%m-%y--%H-%M-%S')

unset token
folder_prefix="gitlab-config_${dt}"
descr="created at ${dt}"
note="note"

while getopts t:f:d: flag; do
    case "${flag}" in
    t) token=${OPTARG} ;;
    f) folder_prefix=${OPTARG} ;;
    d) descr=${OPTARG} ;;
    n) note=${OPTARG} ;;
    esac
done

if [ -z "$token" ]; then
    echo 'Missing token, -t 12345' >&2
    exit 1
fi

echo "token: $token"
echo "folder_prefix: $folder_prefix"
echo "descr: $descr"

f_path="${folder_prefix}-${dt}"

cmd_volume="docker volume create ${f_path}"

cmd_init="docker run -d \
  --name gitlab-runner \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${f_path}:/etc/gitlab-runner \
  gitlab/gitlab-runner:latest"

cmd_register="docker run --rm -v ${f_path}:/etc/gitlab-runner gitlab/gitlab-runner register \
  --non-interactive \
  --executor \"docker\" \
  --docker-image alpine:latest \
  --url \"https://gitlab.com/\" \
  --registration-token \"${token}\" \
  --description \"${descr}\" \
  --maintenance-note \"${note}\" \
  --run-untagged=\"true\" \
  --locked=\"false\" \
  --access-level=\"not_protected\""

output=$(eval "${cmd_volume}")
output=$(eval "${cmd_init}")
output=$(eval "${cmd_register}")
