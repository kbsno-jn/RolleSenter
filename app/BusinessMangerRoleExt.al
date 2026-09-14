pageextension 70101 "Business Manager RC Ext." extends "Business Manager Role Center"
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