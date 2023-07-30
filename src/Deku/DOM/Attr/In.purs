module Deku.DOM.Attr.In where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data In = In

instance Attr FeBlend_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeColorMatrix_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeComponentTransfer_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeComposite_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeConvolveMatrix_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeDiffuseLighting_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeDisplacementMap_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeDropShadow_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeGaussianBlur_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeMergeNode_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeMorphology_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeOffset_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeSpecularLighting_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr FeTile_ In String where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  prop' (fst bothValues)  } (snd bothValues <#> \value -> { key: "in", value:  prop' value  })
  pureAttr In value  = unsafeAttribute $ This { key: "in", value:  prop' value  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \value -> { key: "in", value:  prop' value  }

instance Attr everything In Unit where
  attr In bothValues  = unsafeAttribute $ Both { key: "in", value:  unset'  } (snd bothValues <#> \_ -> { key: "in", value:  unset'  })
  pureAttr In _  = unsafeAttribute $ This { key: "in", value:  unset'  }
  unpureAttr In eventValue  = unsafeAttribute $ That $ eventValue <#> \_ -> { key: "in", value:  unset'  }
