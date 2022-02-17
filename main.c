#include <sndkit/graforge/graforge.h>
#include <sndkit/core.h>
#include <sndkit/lil/lil.h>
#include <sndkit/nodes/sklil.h>

void load_gestvm(lil_t lil);

static void load(lil_t lil)
{
    sklil_loader_withextra(lil);
    load_gestvm(lil);
}

static void clean(lil_t lil)
{
    sklil_clean(lil);
}

int main(int argc, char *argv[])
{
    return lil_main(argc, argv, load, clean);
}
