module Deku.DOM.Attr.Poster where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Video (Video_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Poster = Poster

instance Attr Video_ Poster String where
  attr Poster bothValues = unsafeAttribute $ Both
    { key: "poster", value: prop' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "poster", value: prop' value })
  pureAttr Poster value = unsafeAttribute $ This
    { key: "poster", value: prop' value }
  unpureAttr Poster eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "poster", value: prop' value }

instance Attr everything Poster Unit where
  attr Poster bothValues = unsafeAttribute $ Both
    { key: "poster", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "poster", value: unset' })
  pureAttr Poster _ = unsafeAttribute $ This { key: "poster", value: unset' }
  unpureAttr Poster eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "poster", value: unset' }
