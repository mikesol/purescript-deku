module Deku.DOM.Attr.Srcdoc where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty

import Deku.DOM.Elt.Iframe (Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Srcdoc = Srcdoc

instance Attr Iframe_ Srcdoc (NonEmpty.NonEmpty Event.Event  String ) where
  attr Srcdoc bothValues = unsafeAttribute $ Both (pure 
    { key: "srcdoc", value: prop' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "srcdoc", value: prop' value })
instance Attr Iframe_ Srcdoc (Product.Product (ST.ST Global.Global) Event.Event  String ) where
  attr Srcdoc (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \value ->  
    { key: "srcdoc", value: prop' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "srcdoc", value: prop' value })
instance Attr Iframe_ Srcdoc  String  where
  attr Srcdoc value = unsafeAttribute $ This $ pure $
    { key: "srcdoc", value: prop' value }
instance Attr Iframe_ Srcdoc (Event.Event  String ) where
  attr Srcdoc eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "srcdoc", value: prop' value }

instance Attr Iframe_ Srcdoc (ST.ST Global.Global  String ) where
  attr Srcdoc iValue = unsafeAttribute $ This $ iValue #
    \value -> { key: "srcdoc", value: prop' value }

instance Attr everything Srcdoc (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr Srcdoc bothValues = unsafeAttribute $ Both (pure 
    { key: "srcdoc", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "srcdoc", value: unset' })
instance Attr everything Srcdoc (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr Srcdoc (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues # \_ ->  
    { key: "srcdoc", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "srcdoc", value: unset' })
instance Attr everything Srcdoc  Unit  where
  attr Srcdoc _ = unsafeAttribute $ This $ { key: "srcdoc", value: unset' }
instance Attr everything Srcdoc (Event.Event  Unit ) where
  attr Srcdoc eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "srcdoc", value: unset' }

instance Attr everything Srcdoc (ST.ST Global.Global  Unit ) where
  attr Srcdoc iValue = unsafeAttribute $ This $ iValue # \_ ->
    { key: "srcdoc", value: unset' }
