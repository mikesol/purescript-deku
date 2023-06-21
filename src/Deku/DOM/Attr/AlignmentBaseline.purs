module Deku.DOM.Attr.AlignmentBaseline where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AlignmentBaseline = AlignmentBaseline

instance Attr Tags.FeBlend_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeColorMatrix_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeComponentTransfer_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeComposite_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeConvolveMatrix_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeDiffuseLighting_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeDisplacementMap_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeFlood_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeGaussianBlur_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeImage_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeMerge_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeMorphology_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeOffset_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeSpecularLighting_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeTile_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.FeTurbulence_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.Filter_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.Image_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr Tags.Switch_ AlignmentBaseline String where
  pureAttr AlignmentBaseline value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "alignment-baseline", value }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "alignment-baseline", value: prop' value }

instance Attr everything AlignmentBaseline Unit where
  pureAttr AlignmentBaseline _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "alignment-baseline", value: unset' }
  mapAttr AlignmentBaseline evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "alignment-baseline", value: unset' }
