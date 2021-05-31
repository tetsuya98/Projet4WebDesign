<?php

use Twig\Environment;
use Twig\Error\LoaderError;
use Twig\Error\RuntimeError;
use Twig\Extension\SandboxExtension;
use Twig\Markup;
use Twig\Sandbox\SecurityError;
use Twig\Sandbox\SecurityNotAllowedTagError;
use Twig\Sandbox\SecurityNotAllowedFilterError;
use Twig\Sandbox\SecurityNotAllowedFunctionError;
use Twig\Source;
use Twig\Template;

/* modules/views_bootstrap/templates/views-bootstrap-carousel.html.twig */
class __TwigTemplate_04a418c91c57bc13001a04124d2d6715bb3ce5232dde83d6ebef315692c78f0a extends \Twig\Template
{
    private $source;
    private $macros = [];

    public function __construct(Environment $env)
    {
        parent::__construct($env);

        $this->source = $this->getSourceContext();

        $this->parent = false;

        $this->blocks = [
        ];
        $this->sandbox = $this->env->getExtension('\Twig\Extension\SandboxExtension');
        $this->checkSecurity();
    }

    protected function doDisplay(array $context, array $blocks = [])
    {
        $macros = $this->macros;
        // line 22
        echo "
<div id=\"";
        // line 23
        echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["id"] ?? null), 23, $this->source), "html", null, true);
        echo "\" class=\"carousel ";
        echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["effect"] ?? null), 23, $this->source), "html", null, true);
        echo "\"
    data-interval=\"";
        // line 24
        echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["interval"] ?? null), 24, $this->source), "html", null, true);
        echo "\"
    ";
        // line 25
        if (($context["ride"] ?? null)) {
            echo " data-ride=\"carousel\" ";
        }
        // line 26
        echo "    data-pause=\"";
        if (($context["pause"] ?? null)) {
            echo "hover";
        } else {
            echo "false";
        }
        echo "\"
>
  ";
        // line 29
        echo "  ";
        if (($context["indicators"] ?? null)) {
            // line 30
            echo "  <ol class=\"carousel-indicators\">
      ";
            // line 31
            $context['_parent'] = $context;
            $context['_seq'] = twig_ensure_traversable(($context["rows"] ?? null));
            $context['loop'] = [
              'parent' => $context['_parent'],
              'index0' => 0,
              'index'  => 1,
              'first'  => true,
            ];
            if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof \Countable)) {
                $length = count($context['_seq']);
                $context['loop']['revindex0'] = $length - 1;
                $context['loop']['revindex'] = $length;
                $context['loop']['length'] = $length;
                $context['loop']['last'] = 1 === $length;
            }
            foreach ($context['_seq'] as $context["key"] => $context["row"]) {
                // line 32
                echo "          ";
                $context["indicator_classes"] = [0 => ((twig_get_attribute($this->env, $this->source, $context["loop"], "first", [], "any", false, false, true, 32)) ? ("active") : (""))];
                // line 33
                echo "          <li class=\"";
                echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, twig_join_filter($this->sandbox->ensureToStringAllowed(($context["indicator_classes"] ?? null), 33, $this->source), " "), "html", null, true);
                echo "\" data-target=\"#";
                echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["id"] ?? null), 33, $this->source), "html", null, true);
                echo "\" data-slide-to=\"";
                echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed($context["key"], 33, $this->source), "html", null, true);
                echo "\"></li>
      ";
                ++$context['loop']['index0'];
                ++$context['loop']['index'];
                $context['loop']['first'] = false;
                if (isset($context['loop']['length'])) {
                    --$context['loop']['revindex0'];
                    --$context['loop']['revindex'];
                    $context['loop']['last'] = 0 === $context['loop']['revindex0'];
                }
            }
            $_parent = $context['_parent'];
            unset($context['_seq'], $context['_iterated'], $context['key'], $context['row'], $context['_parent'], $context['loop']);
            $context = array_intersect_key($context, $_parent) + $_parent;
            // line 35
            echo "  </ol>
  ";
        }
        // line 37
        echo "
  ";
        // line 39
        echo "  <div class=\"carousel-inner\">
    ";
        // line 40
        $context['_parent'] = $context;
        $context['_seq'] = twig_ensure_traversable(($context["rows"] ?? null));
        $context['loop'] = [
          'parent' => $context['_parent'],
          'index0' => 0,
          'index'  => 1,
          'first'  => true,
        ];
        if (is_array($context['_seq']) || (is_object($context['_seq']) && $context['_seq'] instanceof \Countable)) {
            $length = count($context['_seq']);
            $context['loop']['revindex0'] = $length - 1;
            $context['loop']['revindex'] = $length;
            $context['loop']['length'] = $length;
            $context['loop']['last'] = 1 === $length;
        }
        foreach ($context['_seq'] as $context["_key"] => $context["row"]) {
            // line 41
            echo "        ";
            $context["row_classes"] = [0 => "carousel-item", 1 => ((twig_get_attribute($this->env, $this->source, $context["loop"], "first", [], "any", false, false, true, 41)) ? ("active") : (""))];
            // line 42
            echo "        <div class=\"";
            echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, twig_join_filter($this->sandbox->ensureToStringAllowed(($context["row_classes"] ?? null), 42, $this->source), " "), "html", null, true);
            echo "\">
        ";
            // line 43
            echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, $context["row"], "image", [], "any", false, false, true, 43), 43, $this->source), "html", null, true);
            echo "
        ";
            // line 44
            if ((twig_get_attribute($this->env, $this->source, $context["row"], "title", [], "any", false, false, true, 44) || twig_get_attribute($this->env, $this->source, $context["row"], "description", [], "any", false, false, true, 44))) {
                // line 45
                echo "            ";
                if (($context["use_caption"] ?? null)) {
                    // line 46
                    echo "            <div class=\"carousel-caption d-none d-md-block\">
            ";
                }
                // line 48
                echo "            ";
                if (twig_get_attribute($this->env, $this->source, $context["row"], "title", [], "any", false, false, true, 48)) {
                    // line 49
                    echo "                <h3>";
                    echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, $context["row"], "title", [], "any", false, false, true, 49), 49, $this->source), "html", null, true);
                    echo "</h3>
            ";
                }
                // line 51
                echo "            ";
                if (twig_get_attribute($this->env, $this->source, $context["row"], "description", [], "any", false, false, true, 51)) {
                    // line 52
                    echo "                <p>";
                    echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(twig_get_attribute($this->env, $this->source, $context["row"], "description", [], "any", false, false, true, 52), 52, $this->source), "html", null, true);
                    echo "</p>
            ";
                }
                // line 54
                echo "            ";
                if (($context["use_caption"] ?? null)) {
                    // line 55
                    echo "            </div>
            ";
                }
                // line 57
                echo "        ";
            }
            // line 58
            echo "        </div>
    ";
            ++$context['loop']['index0'];
            ++$context['loop']['index'];
            $context['loop']['first'] = false;
            if (isset($context['loop']['length'])) {
                --$context['loop']['revindex0'];
                --$context['loop']['revindex'];
                $context['loop']['last'] = 0 === $context['loop']['revindex0'];
            }
        }
        $_parent = $context['_parent'];
        unset($context['_seq'], $context['_iterated'], $context['_key'], $context['row'], $context['_parent'], $context['loop']);
        $context = array_intersect_key($context, $_parent) + $_parent;
        // line 60
        echo "  </div>
  ";
        // line 62
        echo "  ";
        if (($context["navigation"] ?? null)) {
            // line 63
            echo "    <a class=\"carousel-control-prev\" href=\"#";
            echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["id"] ?? null), 63, $this->source), "html", null, true);
            echo "\" role=\"button\" data-slide=\"prev\">
      <span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>
      <span class=\"sr-only\">";
            // line 65
            echo $this->extensions['Drupal\Core\Template\TwigExtension']->renderVar(t("Previous"));
            echo "</span>
    </a>
    <a class=\"carousel-control-next\" href=\"#";
            // line 67
            echo $this->extensions['Drupal\Core\Template\TwigExtension']->escapeFilter($this->env, $this->sandbox->ensureToStringAllowed(($context["id"] ?? null), 67, $this->source), "html", null, true);
            echo "\" role=\"button\" data-slide=\"next\">
      <span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>
      <span class=\"sr-only\">";
            // line 69
            echo $this->extensions['Drupal\Core\Template\TwigExtension']->renderVar(t("Next"));
            echo "</span>
    </a>
  ";
        }
        // line 72
        echo "</div>";
    }

    public function getTemplateName()
    {
        return "modules/views_bootstrap/templates/views-bootstrap-carousel.html.twig";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  232 => 72,  226 => 69,  221 => 67,  216 => 65,  210 => 63,  207 => 62,  204 => 60,  189 => 58,  186 => 57,  182 => 55,  179 => 54,  173 => 52,  170 => 51,  164 => 49,  161 => 48,  157 => 46,  154 => 45,  152 => 44,  148 => 43,  143 => 42,  140 => 41,  123 => 40,  120 => 39,  117 => 37,  113 => 35,  92 => 33,  89 => 32,  72 => 31,  69 => 30,  66 => 29,  56 => 26,  52 => 25,  48 => 24,  42 => 23,  39 => 22,);
    }

    public function getSourceContext()
    {
        return new Source("", "modules/views_bootstrap/templates/views-bootstrap-carousel.html.twig", "/var/www/drupal/web/modules/views_bootstrap/templates/views-bootstrap-carousel.html.twig");
    }
    
    public function checkSecurity()
    {
        static $tags = array("if" => 25, "for" => 31, "set" => 32);
        static $filters = array("escape" => 23, "join" => 33, "t" => 65);
        static $functions = array();

        try {
            $this->sandbox->checkSecurity(
                ['if', 'for', 'set'],
                ['escape', 'join', 't'],
                []
            );
        } catch (SecurityError $e) {
            $e->setSourceContext($this->source);

            if ($e instanceof SecurityNotAllowedTagError && isset($tags[$e->getTagName()])) {
                $e->setTemplateLine($tags[$e->getTagName()]);
            } elseif ($e instanceof SecurityNotAllowedFilterError && isset($filters[$e->getFilterName()])) {
                $e->setTemplateLine($filters[$e->getFilterName()]);
            } elseif ($e instanceof SecurityNotAllowedFunctionError && isset($functions[$e->getFunctionName()])) {
                $e->setTemplateLine($functions[$e->getFunctionName()]);
            }

            throw $e;
        }

    }
}
