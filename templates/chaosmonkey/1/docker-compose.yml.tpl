chaosmonkey:
    image: leodotcloud/chaos-monkey
    tty: true
    command:
        - chaos-monkey
        - --rancher-url=${RANCHER_URL}
        - --rancher-project-id=${RANCHER_PROJECT_ID}
        - --rancher-access-key=${RANCHER_ACCESS_KEY}
        - --rancher-secret-key=${RANCHER_SECRET_KEY}
        {{- if (eq.Values.USE_DIGITALOCEAN "true") }}
        - --use-digitalocean
        - --digitalocean-access-token=${DO_ACCESS_TOKEN}
        {{- end}}
        {{- if (eq.Values.USE_AWS "true") }}
        - --use-aws
        - --aws-secret-key-id=${AWS_SECRET_KEY_ID}
        - --aws-secret-access-key=${AWS_SECRET_ACCESS_KEY}
        {{- end}}
        {{- if (eq.Values.USE_PACKET "true") }}
        - --use-packet
        - --packet-project-id=${PACKET_PROJECT_ID}
        - --packet-project-token=${PACKET_PROJECT_TOKEN}
        {{- end}}
        {{- if (eq .Values.DISABLE_ADD_HOST_SCENARIO "true") }}
        - --disable-add-host-scenario
        {{- end}}
        {{- if (eq .Values.DISABLE_DEL_HOST_SCENARIO "true") }}
        - --disable-del-host-scenario
        {{- end}}
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
