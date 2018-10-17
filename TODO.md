# Mbox

MailingList data-source actually have many options to get data:

- 1 mbox (args: uir dirpath), requires downloaded mbox files (see https://chaoss.github.io/grimoirelab-tutorial/perceval/mail.html).
- 2 groupsio (args groupname) - Groups.io (https://groups.io) using API tokens, it doesn’t have anything in common with Google groups imho.
- 3.  hyperkitty (args url), uses HyperKitty (https://gitlab.com/mailman/hyperkitty) to fetch mbox files, I don’t see a way to use it to fetch ONOS Google group mails archives (https://wiki.onosproject.org/display/ONOS/Mailing+Lists).
- 4 nntp (args host group) uses NNTP host+group to get archives (not sure if I can access ONOS google groups mailing list using this, will have to investigate).
- 5 pipermail (args url) uses Pipermail to fetch archives. All those datasources use ‘message’ category.


Kidash

- Contine with `kidash.sh`. Identify which dashboards will correctly display available data.
