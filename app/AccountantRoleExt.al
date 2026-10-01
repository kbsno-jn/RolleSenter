pageextension 78902 "Accountant RC Ext." extends "Accountant Role Center"
{
    layout
    {
        modify("Job Queue Tasks Activities")
        {
            Visible = false;
        }

        addafter("Job Queue Tasks Activities")
        {
            part(MyJobQueueActivities; "My Job Queue Activities")
            {
                ApplicationArea = Suite;
            }
        }
    }
}
