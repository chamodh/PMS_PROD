using System;
using System.Collections.Generic;

namespace MadampeTeaEstate.PMS.EntityFrameWork.Models
{
    public partial class webpages_OAuthMembership
    {
        public string Provider { get; set; }
        public string ProviderUserId { get; set; }
        public int UserId { get; set; }
    }
}
