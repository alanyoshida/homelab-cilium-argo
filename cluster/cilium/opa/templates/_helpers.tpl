{{/* Generate VolumeMounts for policies */}}
{{- define "opa.policies.volumeMounts" -}}
        volumeMounts:
        {{- range .Values.policies }}
        - readOnly: true
          mountPath: /policies/{{ . }}.rego
          name: {{ . }}
        {{- end }}
{{- end }}

{{/* Generate Volumes for policies */}}
{{- define "opa.policies.volume" -}}
      volumes:
      {{- range  .Values.policies }}
      - name: {{ . }}
        configMap:
          name: {{ . }}
      {{- end }}
{{- end }}