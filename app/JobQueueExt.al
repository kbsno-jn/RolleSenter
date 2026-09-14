page 70100 "My Job Queue Activities"
{
    PageType = CardPart;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            cuegroup("Jobbkøoppgaver")
            {
                field(ContiniaFailedEntries; ContiniaFailedEntries)
                {
                    ApplicationArea = All;
                    Caption = 'Continia error';

                    trigger OnDrillDown()
                    var
                        JobQueueEntry: Record "Job Queue Entry";
                    begin
                        JobQueueEntry.SetRange(
                            Status,
                            JobQueueEntry.Status::Error);
                        JobQueueEntry.SetFilter("Object ID to Run", '6192778..6225999|71554352|71553991|71553982|71553881|71553647');

                        Page.Run(
                            Page::"Job Queue Entries",
                            JobQueueEntry);
                    end;
                }
                field(ImosFailedEntries; ImosFailedEntries)
                {
                    ApplicationArea = All;
                    Caption = 'Imos error';

                    trigger OnDrillDown()
                    var
                        JobQueueEntry: Record "Job Queue Entry";
                    begin
                        JobQueueEntry.SetRange(
                            Status,
                            JobQueueEntry.Status::Error);
                        JobQueueEntry.SetRange("Object ID to Run", 62500, 62599);

                        Page.Run(
                            Page::"Job Queue Entries",
                            JobQueueEntry);
                    end;
                }
                field(JobQueueEntryRecordErrors; JobQueueEntryRecordErrors)
                {
                    ApplicationArea = All;
                    Caption = 'Jobbkø feil';

                    trigger OnDrillDown()
                    var
                        JobQueueEntry: Record "Job Queue Entry";
                    begin
                        JobQueueEntry.SetRange(
                            Status,
                            JobQueueEntry.Status::Error);

                        Page.Run(
                            Page::"Job Queue Entries",
                            JobQueueEntry);
                    end;
                }
                field(QueueEntries; QueueEntries)
                {
                    ApplicationArea = All;
                    Caption = 'Alle jobbkøoppgaver';

                    trigger OnDrillDown()
                    var
                        JobQueueEntry: Record "Job Queue Entry";
                    begin
                        Page.Run(
                            Page::"Job Queue Entries",
                            JobQueueEntry);
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        CalculateCues();
    end;

    local procedure CalculateCues()
    var
        JobQueueEntry: Record "Job Queue Entry";
    begin
        QueueEntries := JobQueueEntry.Count();

        JobQueueEntry.Reset();
        JobQueueEntry.SetRange(
            Status,
            JobQueueEntry.Status::Error);
        JobQueueEntry.SetFilter("Object ID to Run", '6192778..6225999|71554352|71553991|71553982|71553881|71553647');
        ContiniaFailedEntries := JobQueueEntry.Count();

        JobQueueEntry.Reset();
        JobQueueEntry.SetRange(
            Status,
            JobQueueEntry.Status::Error);
        JobQueueEntry.SetRange("Object ID to Run", 62500, 62599);
        ImosFailedEntries := JobQueueEntry.Count();

        JobQueueEntry.Reset();
        JobQueueEntry.SetRange(
            Status,
            JobQueueEntry.Status::Error);
        JobQueueEntryRecordErrors := JobQueueEntry.Count();
    end;

    var
        QueueEntries: Integer;
        ContiniaFailedEntries: Integer;
        ImosFailedEntries: Integer;
        JobQueueEntryRecordErrors: Integer;
}