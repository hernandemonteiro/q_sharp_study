namespace MeuProjetoQSharp {

    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Main() : Unit {
        for i in 1..5 {
            use (q1, q2) = (Qubit(), Qubit());
            H(q1);
            CNOT(q1, q2);
            DumpMachine();
            let (m1, m2) = (M(q1), M(q2));
            Message($"Medições: {m1}, {m2}");
            Reset(q1);
            Reset(q2);
        }
    }
}
