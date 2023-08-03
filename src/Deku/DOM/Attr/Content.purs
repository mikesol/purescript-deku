module Deku.DOM.Attr.Content where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Meta (Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Content = Content

instance Attr Meta_ Content (NonEmpty.NonEmpty Event.Event  String ) where
  attr Content bothValues = unsafeAttribute $ Both (pure 
    { key: "content", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "content", value: prop' value })
instance Attr Meta_ Content (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Content (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "content", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "content", value: prop' value })
instance Attr Meta_ Content  String  where
  attr Content value = unsafeAttribute $ This $ pure $
    { key: "content", value: prop' value }
instance Attr Meta_ Content (Event.Event  String ) where
  attr Content eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "content", value: prop' value }

instance Attr Meta_ Content (ST.ST Global.Global  String ) where
  attr Content stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "content", value: prop' value }

instance Attr everything Content (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Content bothValues = unsafeAttribute $ Both (pure 
    { key: "content", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "content", value: unset' })
instance Attr everything Content (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Content (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "content", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "content", value: unset' })
instance Attr everything Content  Unit  where
  attr Content _ = unsafeAttribute $ This $ pure $ { key: "content", value: unset' }
instance Attr everything Content (Event.Event  Unit ) where
  attr Content eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "content", value: unset' }

instance Attr everything Content (ST.ST Global.Global  Unit ) where
  attr Content stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "content", value: unset' }
