module Deku.DOM.Attr.StartOffset where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data StartOffset = StartOffset

instance Attr TextPath_ StartOffset (NonEmpty.NonEmpty Event.Event  String ) where
  attr StartOffset bothValues = unsafeAttribute $ Both (pure 
    { key: "startOffset", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "startOffset", value: prop' value })
instance Attr TextPath_ StartOffset (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr StartOffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "startOffset", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "startOffset", value: prop' value })
instance Attr TextPath_ StartOffset  String  where
  attr StartOffset value = unsafeAttribute $ This $ pure $
    { key: "startOffset", value: prop' value }
instance Attr TextPath_ StartOffset (Event.Event  String ) where
  attr StartOffset eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "startOffset", value: prop' value }

instance Attr TextPath_ StartOffset (ST.ST Global.Global  String ) where
  attr StartOffset iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "startOffset", value: prop' value }

instance Attr everything StartOffset (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr StartOffset bothValues = unsafeAttribute $ Both (pure 
    { key: "startOffset", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "startOffset", value: unset' })
instance Attr everything StartOffset (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr StartOffset (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "startOffset", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "startOffset", value: unset' })
instance Attr everything StartOffset  Unit  where
  attr StartOffset _ = unsafeAttribute $ This $ pure $
    { key: "startOffset", value: unset' }
instance Attr everything StartOffset (Event.Event  Unit ) where
  attr StartOffset eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "startOffset", value: unset' }

instance Attr everything StartOffset (ST.ST Global.Global  Unit ) where
  attr StartOffset iValue = unsafeAttribute $ This $ iValue #
    \_ -> { key: "startOffset", value: unset' }
