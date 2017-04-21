chaosmonkey:
    image: leodotcloud/chaos-monkey
    tty: true
    command:
        - chaos-monkey
        - --rancher-url=${RANCHER_URL}
        - --rancher-project-id=${RANCHER_PROJECT_ID}
        - --rancher-access-key=${RANCHER_ACCESS_KEY}
        - --rancher-secret-key=${RANCHER_SECRET_KEY}
        - --digitalocean-access-token=${DO_ACCESS_TOKEN}
        - --start-cluster-size=${START_CLUSTER_SIZE}
        - --min-cluster-size=${MIN_CLUSTER_SIZE}
        - --max-cluster-size=${MAX_CLUSTER_SIZE}
        - --min-wait=${MIN_WAIT_TIME}
        - --max-wait=${MAX_WAIT_TIME}
        {{- if (ne .Values.SEED "") }}
        - --seed=${SEED}
        {{- end}}
        {{- if (ne .Values.RANCHER_DEBUG "") }}
        - --debug
        {{- end}}
