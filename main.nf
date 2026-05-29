process MULTIQC {
    output:
    path 'multiqc_report.html'

    script:
    """
    echo "<html>fake multiqc report</html>" > multiqc_report.html
    """
}

process ALIGN {
    output:
    path 'sample.bam'

    script:
    """
    echo "fake bam data" > sample.bam
    """
}

workflow {
    main:
    report = MULTIQC()
    bam    = ALIGN()

    publish:
    multiqc_report = report
    alignments     = bam
}

output {
    multiqc_report {
        label 'qc'
        label 'summary'
    }
    alignments {
        label 'alignment'
    }
}
