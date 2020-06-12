task calc_expression {
  String left_fastq
  String right_fastq

  command {
    echo "Aligning fastqs and calculating expression" > out_log.txt
    echo "Created output.transcript.bam and output_matrix.txt" >> out_log.txt
    echo "Creating qc matrix" >> out_log.txt
    ls -l /*/* >> out_log.txt
  }
  runtime {
    docker: "ubuntu"
    memory: "2 GB" 
    disks: "local-disk 10 HDD"
  }
  output {
    File log = "out_log.txt"
  }
}

workflow mock_smartseq2 {
 String left_fastq_file
  String right_fastq_file

  call calc_expression {
    input:
      left_fastq = left_fastq_file,
      right_fastq = right_fastq_file
  }
}
