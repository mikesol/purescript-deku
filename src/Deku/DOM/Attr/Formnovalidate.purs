module Deku.DOM.Attr.Formnovalidate where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Formnovalidate = Formnovalidate

instance Attr Tags.Button_ Formnovalidate String where
  pureAttr Formnovalidate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formnovalidate", value }
  mapAttr Formnovalidate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formnovalidate", value: prop' value }

instance Attr Tags.Input_ Formnovalidate String where
  pureAttr Formnovalidate value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "formnovalidate", value }
  mapAttr Formnovalidate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formnovalidate", value: prop' value }

instance Attr everything Formnovalidate Unit where
  pureAttr Formnovalidate _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "formnovalidate", value: unset' }
  mapAttr Formnovalidate evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "formnovalidate", value: unset' }
