namespace MeuProjetoQSharp {
    // Importa funcionalidades para diagnosticar e inspecionar o estado quântico
    open Microsoft.Quantum.Diagnostics;
    // Importa operações e funções utilitárias para Q#
    open Microsoft.Quantum.Canon;
    // Importa portas quânticas intrínsecas
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    // Declara a operação principal do programa
    operation Main() : Unit {
        // Loop que executa a lógica quântica 5 vezes
        for i in 1..5 {
            // Aloca temporariamente dois qubits (q1, q2)
            use (q1, q2) = (Qubit(), Qubit());
            // Aplica a porta Hadamard em q1
            H(q1);
            // Aplica CNOT usando q1 como controle e q2 como alvo
            CNOT(q1, q2);
            // Mostra o estado atual do computador quântico no console
            DumpMachine();
            // Mede q1 e q2, armazenando os resultados em m1 e m2
            let (m1, m2) = (M(q1), M(q2));
            // Exibe a mensagem contendo as medições
            Message($"Medições: {m1}, {m2}");
            // Restaura q1 e q2 para o estado |0>
            Reset(q1);
            Reset(q2);
        }
    }
}
