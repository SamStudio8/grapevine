import datetime

date = datetime.date.today()

rule split_based_on_lineages:
    input:
        #fasta =,
        #metadata =,
        lineage = config["lineage_splits"]
    output:
    log:
        config["output_path"] + "/logs/4_split_based_on_lineages.log"
    shell:
        """
        lineages=$(cat {input.lineage} | cut -f1 --delim "," | tr '\n' '  ')
        fastafunk split \
          #--in-fasta {input.fasta} \
          #--in-metadata {input.metadata} \
          --index-column sequence_name \
          --index-field lineage \
          --lineage $lineages \
        """